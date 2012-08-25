From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 25 Aug 2012 21:11:30 +0200
Subject: [Buildroot] Busybox Mips
In-Reply-To: <CAJhJPsU3eUkJf=Yqr6E9tP9ZGRzY-L20XkaXa5Sk3k-QZ-804Q@mail.gmail.com>
 (Kelvin Cheung's message of "Fri, 24 Aug 2012 10:36:57 +0800")
References: <CAN5RZzLtbpQ30PAgpuNj_hGF6Eia42ZvxgH3Emh3AESHU-1C=g@mail.gmail.com>
 <CAN5RZz+SZeqpeZ6vBPT63Gj7k2sozQ9sCk5sogKBs+O-JA2ixA@mail.gmail.com>
 <CAJhJPsWaU1B_Cq=ZJZQrqUzaHt_JGq4khPj=kDpM37hVLT0YKg@mail.gmail.com>
 <CAN5RZzLr+vGuiVw4oRGF40bvvZ33gaxPt_LvSLBvauOmEK7PZw@mail.gmail.com>
 <CAJhJPsU3eUkJf=Yqr6E9tP9ZGRzY-L20XkaXa5Sk3k-QZ-804Q@mail.gmail.com>
Message-ID: <876286rdlp.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Kelvin" == Kelvin Cheung <keguang.zhang@gmail.com> writes:

 Kelvin> The 1.18.x was marked as deprecated in this April.
 Kelvin> I'm afraid you need to downgrade to 2012.02 or earlier.
 Kelvin> Otherwise, you have to modify package/busybox/Config.in manually.

Or just enable BR2_DEPRECATED (Build options->Show packages that are
deprecated or obsolete)

-- 
Bye, Peter Korsgaard
