From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 14 Jan 2015 18:19:02 -0300
Subject: [Buildroot] [PATCH 1/2] rsyslog: remove pointless umask from
 sysv initscript
In-Reply-To: <20150114221549.5f12df01@free-electrons.com>
References: <1421266617-9201-1-git-send-email-gustavo@zacarias.com.ar>
 <20150114221549.5f12df01@free-electrons.com>
Message-ID: <54B6DD46.9040007@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 01/14/2015 06:15 PM, Thomas Petazzoni wrote:

> Thanks, both patches applied. I've added 3 more patches on top to do
> some further minor cleanup/improvements in rsyslog.mk.

The explicit disable is a bit redundant since most rsyslog options are
default off but upstream can always change that and silently break
things on bumps on the other hand.
Regards.
