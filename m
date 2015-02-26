From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 26 Feb 2015 23:10:58 +0100
Subject: [Buildroot] [PATCH v2] libgtk2: skip tutorial and faq build
In-Reply-To: <20150226214959.GC3914@free.fr> (Yann E. MORIN's message of "Thu, 
 26 Feb 2015 22:50:00 +0100")
References: <20150224235024.844FBE0447@smtp.hushmail.com>
 <877fv57f9j.fsf@dell.be.48ers.dk>
 <20150226163433.340EDE044A@smtp.hushmail.com>
 <87385s74rm.fsf@dell.be.48ers.dk> <20150226214959.GC3914@free.fr>
Message-ID: <87vbio493h.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Peter, All,
 > On 2015-02-26 22:16 +0100, Peter Korsgaard spake thusly:
 >> >>>>> "justin" == justin swartz <justin.swartz@nym.hush.com> writes:
 >> > On 02/26/2015 at 1:17 AM, "Peter Korsgaard" <peter@korsgaard.com> wrote:
 >> >> Why not just pass DB2HTML=false in LIBGTK2_CONF_ENV?
 >> >> 
 >> > DB2HTML=false works perfectly, thanks for pointing that out!
 >> 
 >> Great. I've committed a fix to pass it.

 > Hmm... Didn't you see his v2?

V3 you mean? Sorry, I didn't (slow mail).

-- 
Peter Korsgaard 
