From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 28 Dec 2014 12:37:16 +0100
Subject: [Buildroot] [PATCH 1/2] package/freerdp: do not use Neon
	extensions when not available
In-Reply-To: <20141228113356.GA4254@free.fr> (Yann E. MORIN's message of "Sun, 
 28 Dec 2014 12:33:56 +0100")
References: <cover.1419704115.git.yann.morin.1998@free.fr>
 <dc7aed907743824f29e6000e45e01388ae8cf0dd.1419704115.git.yann.morin.1998@free.fr>
 <8761cwdn90.fsf@dell.be.48ers.dk> <20141228113356.GA4254@free.fr>
Message-ID: <871tnkdmz7.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

Hi,

>> > Heck, what's more, none non-ARM processor has Neon extensions!
 >> > The regexp to detect the CPU is borked:  'arm*'  will also match 'arc'
 >> > as well as 'arm'.
 >> 
 >> Huh, how does arm* march arc?

 > Already answered on IRC, but for the records: this is not a glob, this
 > is a regexp.

Yes, thanks.

-- 
Bye, Peter Korsgaard 
