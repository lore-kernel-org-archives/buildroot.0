From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 14 Jan 2015 17:16:10 -0300
Subject: [Buildroot] [PATCH 2/2] squid: add sysv initscript
In-Reply-To: <20150114205151.18568a75@free-electrons.com>
References: <1421262884-5512-1-git-send-email-gustavo@zacarias.com.ar>	<1421262884-5512-2-git-send-email-gustavo@zacarias.com.ar>
 <20150114205151.18568a75@free-electrons.com>
Message-ID: <54B6CE8A.8030504@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 01/14/2015 04:51 PM, Thomas Petazzoni wrote:
> I must say I'm not very happy with those "if something is missing,
> let's bail out silently" tests. We're doing the same in other init
> scripts (as we discussed on IRC), but I think we should probably
> rethink that a bit, and at least display an error message.
> 
> Also, checking for /usr/sbin/squid sound a bit silly, since the init
> script is installed by the squid package, which also has installed the
> squid binary.
> 
> I've nonetheless applied. Follow-up patches welcome, maybe as part of a
> more global overhaul of our init scripts.

I'll write up my proposal tonight and send it to the mailing list since
i've got many ideas already written up.
I don't want to change too many initscripts without a green card first
since it requires quite some testing.
Regards.
