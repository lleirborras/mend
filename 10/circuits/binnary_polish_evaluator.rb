# Autogenerated from a Treetop grammar. Edits may be lost.


module Circuits
  module BinnaryPolishEvaluator
    include Treetop::Runtime

    def root
      @root ||= :operation
    end

    module Operation0
      def operator
        elements[0]
      end

      def operand1
        elements[1]
      end

      def operand2
        elements[2]
      end
    end

    module Operation1
      def value
        case operator.value
        when "A"
          operand1.value && operand2.value
        when "O"
          operand1.value || operand2.value
        when "X"
          !(operand1.value==operand2.value)
        end
      end
    end

    module Operation2
      def operand
        elements[1]
      end
    end

    module Operation3
      def value
        !operand.value
      end
    end

    def _nt_operation
      start_index = index
      if node_cache[:operation].has_key?(index)
        cached = node_cache[:operation][index]
        if cached
          cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
          @index = cached.interval.end
        end
        return cached
      end

      i0 = index
      i1, s1 = index, []
      r2 = _nt_operator
      s1 << r2
      if r2
        r3 = _nt_operand
        s1 << r3
        if r3
          r4 = _nt_operand
          s1 << r4
        end
      end
      if s1.last
        r1 = instantiate_node(SyntaxNode,input, i1...index, s1)
        r1.extend(Operation0)
        r1.extend(Operation1)
      else
        @index = i1
        r1 = nil
      end
      if r1
        r0 = r1
      else
        i5, s5 = index, []
        if has_terminal?("N", false, index)
          r6 = instantiate_node(SyntaxNode,input, index...(index + 1))
          @index += 1
        else
          terminal_parse_failure("N")
          r6 = nil
        end
        s5 << r6
        if r6
          r7 = _nt_operand
          s5 << r7
        end
        if s5.last
          r5 = instantiate_node(SyntaxNode,input, i5...index, s5)
          r5.extend(Operation2)
          r5.extend(Operation3)
        else
          @index = i5
          r5 = nil
        end
        if r5
          r0 = r5
        else
          @index = i0
          r0 = nil
        end
      end

      node_cache[:operation][start_index] = r0

      r0
    end

    module Operator0
      def value
        text_value
      end
    end

    def _nt_operator
      start_index = index
      if node_cache[:operator].has_key?(index)
        cached = node_cache[:operator][index]
        if cached
          cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
          @index = cached.interval.end
        end
        return cached
      end

      if has_terminal?('\G[AOX]', true, index)
        r0 = instantiate_node(SyntaxNode,input, index...(index + 1))
        r0.extend(Operator0)
        @index += 1
      else
        r0 = nil
      end

      node_cache[:operator][start_index] = r0

      r0
    end

    module Operand0
      def value
        [false, true][text_value.to_i]
      end
    end

    def _nt_operand
      start_index = index
      if node_cache[:operand].has_key?(index)
        cached = node_cache[:operand][index]
        if cached
          cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
          @index = cached.interval.end
        end
        return cached
      end

      i0 = index
      r1 = _nt_operation
      if r1
        r0 = r1
      else
        if has_terminal?('\G[01]', true, index)
          r2 = instantiate_node(SyntaxNode,input, index...(index + 1))
          r2.extend(Operand0)
          @index += 1
        else
          r2 = nil
        end
        if r2
          r0 = r2
        else
          @index = i0
          r0 = nil
        end
      end

      node_cache[:operand][start_index] = r0

      r0
    end

  end

  class BinnaryPolishEvaluatorParser < Treetop::Runtime::CompiledParser
    include BinnaryPolishEvaluator
  end

end
