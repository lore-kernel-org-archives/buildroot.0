From: W.P. <laurentp@wp.pl>
Date: Mon, 12 Oct 2009 22:28:59 +0200
Subject: [Buildroot] setting up buildroot for using OLD gcc / binutils
In-Reply-To: <87my3w4bw6.fsf@macbook.be.48ers.dk>
References: <4AD389B2.20400@wp.pl> <87my3w4bw6.fsf@macbook.be.48ers.dk>
Message-ID: <4AD3918B.5000908@wp.pl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

U?ytkownik Peter Korsgaard napisa?:
>>>>>> "W" == W P <laurentp@wp.pl> writes:
>>>>>>             
>
>  W> Hi,
>  W> how can I set up CURRENT buildroot to use OLD gcc/binutils/kernel/uClibc?
>  W> I need gcc 3.4.4, kernel 2.6.12.6-venus, uClibc 0.9.28?
>
> Some older toolchain versions are available if you enable BR_DEPRECATED
> (Build options->Show packages that are deprecated or obsolete). It won't
> give you those exact options, but it might be close enough.
>
>   
Almost :(

With choosing this option I am able to select gcc down-to 3.4.6,
binutils 2.17, uClibc 0.9.28.3, kernel 2.6.2x ...

Could you point me to the file where are these choices are in? If I know
in what file, then adding an option ex. to gcc 3.4.4 instead of 3.4.6
should be easy...

W.P.
