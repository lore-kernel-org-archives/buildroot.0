From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 14 Jan 2015 18:31:46 -0300
Subject: [Buildroot] [PATCH 1/2] rsyslog: remove pointless umask from
 sysv initscript
In-Reply-To: <20150114223016.1d50d7c9@free-electrons.com>
References: <1421266617-9201-1-git-send-email-gustavo@zacarias.com.ar>	<20150114221549.5f12df01@free-electrons.com>	<54B6DD46.9040007@zacarias.com.ar>
 <20150114223016.1d50d7c9@free-electrons.com>
Message-ID: <54B6E042.8010006@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 01/14/2015 06:30 PM, Thomas Petazzoni wrote:

> Well, we already had an explicit disable for libgcrypt, and for most
> packages, we try to make the disable explicit anyway, so I simply erred
> on the safe side here.

rsyslog has many more options that we don't handle, but i'll leave it as
is, i think the reasonable use cases a covered :)
Someone else feel free to add more bloa^H^H^H^Hoptions!
Regards.
