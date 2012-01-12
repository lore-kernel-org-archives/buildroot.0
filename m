From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 12 Jan 2012 22:04:35 +0100
Subject: [Buildroot] Error in patch file
In-Reply-To: <F9C551623D2CBB4C9488801D14F864C60F0F51@ex-mb1.corp.adtran.com>
 (ANDY KENNEDY's message of "Thu, 12 Jan 2012 20:48:02 +0000")
References: <F9C551623D2CBB4C9488801D14F864C60F0F51@ex-mb1.corp.adtran.com>
Message-ID: <87r4z47huk.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "ANDY" == ANDY KENNEDY <ANDY.KENNEDY@adtran.com> writes:

 ANDY> I had an error in an file I was working with, so I searched via:
 ANDY> grep -rI '\\[        ][      ]*$' .

 ANDY> In case LookOut morphs this, the [ 	] is <space><tab>.

 ANDY> It returns:
 ANDY> ./package/java/jamvm/jamvm-1.5.0.patch.avr32:
 ANDY> +//        printf("compare and swap %d %d %s:line%d\n",oldval,newval,__FILE__,__LINE__);   \ 

 ANDY> Note:  there is a space at the end of this line, negating the \ for line continuation.

 ANDY> I don't know whether this patch is even used.  There are no sigs
 ANDY> in the patch file either.

No, because I marked the java packages as broken back in July
2010. Nobody seemed to have cared about it, so I will now remove the
packages.

-- 
Bye, Peter Korsgaard
