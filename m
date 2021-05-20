From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 20 May 2021 22:49:50 +0200
Subject: [Buildroot] [PATCHv6 2/5] package/bcc: new package
In-Reply-To: <f8632936-986c-6c2e-3b40-b40c71cecd6c@mind.be>
References: <20201220151203.2206747-1-romain.naour@gmail.com>
 <20201220151203.2206747-2-romain.naour@gmail.com>
 <f8632936-986c-6c2e-3b40-b40c71cecd6c@mind.be>
Message-ID: <6e173124-9ed3-9d76-5275-33b35cc29150@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 20/05/2021 22:35, Arnout Vandecappelle wrote:
>> BCC can be tested on the target :
>> $ mount -t debugfs none /sys/kernel/debug
>> $ cd /usr/share/bcc/tools
>> $ ./execsnoop
>  It would be nice to create a runtime test that does exactly this!

 Such a runtime test should build the kernel itself (with a minimal config),
because that way we test if the KCONFIG_ENABLE_OPT calls are correct.


 Regards,
 Arnout
