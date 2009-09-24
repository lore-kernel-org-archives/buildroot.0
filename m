From: Daniel.Li <lida_mail@163.com>
Date: Fri, 25 Sep 2009 06:22:04 +0800
Subject: [Buildroot] latest buildroot build toolchain failed -- help
Message-ID: <1253830924.12641.2.camel@daniel-laptop>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear All,

I just get a latest buildroot for git repository. And configed to my arm
processor, but compile failed. How can I fix it?

ARM (920t) , Host (ubuntu Jaunty)


checking if _GLOBAL_OFFSET_TABLE_ is prefixed by underscore... no
checking if the assembler takes cl with shldl... yes
checking for unsigned short... yes
checking size of unsigned short... 2
checking for unsigned... yes
checking size of unsigned... 4
checking for unsigned long... yes
checking size of unsigned long... 4
checking for mp_limb_t... yes
checking size of mp_limb_t... 4
checking for stack_t... yes
checking for tputs in -lncurses... yes
checking for readline in -lreadline... no
checking readline detected... no
checking for bison... bison -y
checking for flex... flex
checking for yywrap in -lfl... yes
checking lex output file root... configure: error: cannot find output
from flex; giving up
make: ***
[/home/daniel/frwork/buildroot/output/toolchain/gmp-4.2.4-host/.configured] Error 1




-- 
Daniel.Li <lida_mail@163.com>
