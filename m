From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun, 31 Jan 2016 10:38:06 -0300
Subject: [Buildroot] [PATCH] Revert "package/openvpn: bump version to
 2.3.10"
In-Reply-To: <3ue1ocx40l.ln2@ID-313208.user.individual.net>
References: <1454246790-8381-1-git-send-email-gustavo@zacarias.com.ar>
 <3ue1ocx40l.ln2@ID-313208.user.individual.net>
Message-ID: <56AE0E3E.1050607@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 31/01/16 10:31, Bernd Kuhls wrote:

> Hi,
>
> what about bumping polarssl to 1.3?
>
> Regards, Bernd

Hi.
I think it's possible but it needs patching since it conflicts with 
mbedtls (the famous rename), in order for mbedtls to install everything 
as polarssl.
Also shairport-sync might not like the bump, APIs changed between 
1.2/1.3/2.x
And no, openvpn releases doesn't work with 2.x mbedtls, i think there's 
work in progress in master towards 2.4.x but i'd advice against using that.
Regards.
