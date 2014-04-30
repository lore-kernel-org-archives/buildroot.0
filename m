From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 30 Apr 2014 09:29:32 +0200
Subject: [Buildroot] [PATCH v3] uboot-tools: bump to version 2014.04
In-Reply-To: <1398842399.21385.2.camel@abrodkin-8560l> (Alexey Brodkin's
 message of "Wed, 30 Apr 2014 07:19:59 +0000")
References: <1398840891-19524-1-git-send-email-abrodkin@synopsys.com>
 <877g67thh9.fsf@dell.be.48ers.dk>
 <1398842399.21385.2.camel@abrodkin-8560l>
Message-ID: <87y4yns2ar.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Alexey" == Alexey Brodkin <Alexey.Brodkin@synopsys.com> writes:

 >> That's not true. They are flags for the preprocessor. You must be
 >> confusing them with CXXFLAGS.
 >> 
 >> With that said, I think we're passing everything from HOST_CPPFLAGS
 >> through HOST_CFLAGS as well, so it shouldn't matter.

 > Ok I think I did confused wit CXXFLAGS.

 > But I haven't found any mention of HOSTCPPFLAGS in current U-Boot so I'm
 > wondering if we still need to add any handling of HOSTCPPFLAGS in U-Boot
 > or there's nothing to be done?

No, I also don't see it used anywhere in u-boot nowadays, so the patch
can get dropped.

I'll adjust the commit message when I commit (unless review finds other
issues).

-- 
Bye, Peter Korsgaard 
