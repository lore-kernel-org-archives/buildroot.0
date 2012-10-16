From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 16 Oct 2012 18:03:43 -0300
Subject: [Buildroot] [git commit] package: add gnupg
In-Reply-To: <87a9vmt9n5.fsf@macbook.be.48ers.dk>
References: <20121015082204.6813A99871@busybox.osuosl.org>
 <20121016185610.36a03eff@skate> <87ipaatf0w.fsf@macbook.be.48ers.dk>
 <507DB21F.1090506@mind.be> <87a9vmt9n5.fsf@macbook.be.48ers.dk>
Message-ID: <507DCBAF.6010207@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 10/16/12 18:00, Peter Korsgaard wrote:

> I believe the threads issue was only with gnupg 2.x. This issue was
> simply configure doing the wrong thing when cross compiling (which I
> have now fixed).

Yup, the problem is pth touching glibc thread internals which uclibc lacks.
Regards.
