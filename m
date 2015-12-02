From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 2 Dec 2015 19:17:41 -0300
Subject: [Buildroot] [PATCH 8/9] wireshark: add optional geoip support
In-Reply-To: <20151202215256.GH5773@free.fr>
References: <1449089301-29762-1-git-send-email-gustavo@zacarias.com.ar>
 <1449089301-29762-8-git-send-email-gustavo@zacarias.com.ar>
 <20151202215256.GH5773@free.fr>
Message-ID: <565F6E05.8000306@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 02/12/15 18:52, Yann E. MORIN wrote:

> Is it needed to specify the path? Can't we just have;
>      WIRESHARK_CONF_OPTS += --with-geoip
>
> If the path is needed, then a little blrb in the commit log would be
> nice.
>
> And I forgot to add a similar comment for the --with-XXX=yes options.

Hi.
I don't have geoip in the distro, however it doesn't use pkgconfig so in 
this case and given other wireshark options having issues "better safe 
than sorry".
Regards.
