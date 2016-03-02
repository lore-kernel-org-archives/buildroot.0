From: Rodrigo Rebello <rprebello@gmail.com>
Date: Tue, 1 Mar 2016 22:27:56 -0300
Subject: [Buildroot] [PATCH v2 1/2] sdl_mixer: add patch to fix
 SDL_mixer.pc for static linking
In-Reply-To: <56D60DF5.1060308@mind.be>
References: <1456830948-4329-1-git-send-email-rprebello@gmail.com>
 <56D60DF5.1060308@mind.be>
Message-ID: <CABLs7GUixJvaUuHy6Cp=TjWHuj5j1PchAJyVeCfrLfCxrYTa8g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout,

2016-03-01 18:47 GMT-03:00 Arnout Vandecappelle <arnout@mind.be>:
[snip]
>
>  Try
>
> SDL_MIXER_AUTORECONF_OPTS = -Iacinclude
>

Works fine, thanks! I'll respin this patch.

Regards,
Rodrigo
