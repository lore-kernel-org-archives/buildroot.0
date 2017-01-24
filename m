From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 24 Jan 2017 07:17:11 -0300
Subject: [Buildroot] [PATCH 1/2] vala: fix package suffix
In-Reply-To: <20170124231418.3d5f2985@free-electrons.com>
References: <20170112133831.12223-1-Vincent.Riera@imgtec.com>
 <20170124231418.3d5f2985@free-electrons.com>
Message-ID: <07705b3b-bc14-338b-888f-f50dabeffd4b@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 24/01/17 07:14, Thomas Petazzoni wrote:

> Nope, that is not needed I believe.
>
> Like all Gnome projects, 0.35 is not a stable vala version, so there's
> no reason to package it. And I guess that also explains why vala 0.35
> still uses 0.34 as the package suffix.
>
> So, by not package a development version, we also don't need this "fix
> package suffix" patch.
>
> Best regards,
>
> Thomas

Hi All.
Indeed, odd major numbers in the gnome project are development versions, 
like gtk 3.89, glib 2.51 and others.
Regards.
