From: Viallard Anthony <viallard@syscom-instruments.com>
Date: Mon, 22 Jun 2015 14:07:14 +0200
Subject: [Buildroot] [PATCH 1/1] Force rebuild of local site packages
 and theirs local dependencies
In-Reply-To: <5587E032.8030506@syscom-instruments.com>
References: <1434460888-30770-1-git-send-email-viallard@syscom-instruments.com>
 <20150616215022.6eb61f22@free-electrons.com>
 <5587E032.8030506@syscom-instruments.com>
Message-ID: <5587FA72.8050902@syscom-instruments.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06/22/2015 12:15 PM, Viallard Anthony wrote:
> If there was a "make rebuild" target and if the "make <pkg>-rebuild" was
> able to rebuild all the dependencies too, it will satisfy my needs.
>
> Regards,
> Anthony.
>

An important thing is we don't increase the version of the package after 
a change. But it's not very convenient to increase the version after 
each small changes...

Regards,
Anthony.
