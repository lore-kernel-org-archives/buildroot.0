From: Romain Naour <romain.naour@openwide.fr>
Date: Sat, 22 Nov 2014 01:22:29 +0100
Subject: [Buildroot] [PATCH v3] pkg-cmake.mk: Set CMAKE_SYSTEM_PROCESSOR.
In-Reply-To: <1416254561-12691-1-git-send-email-volker.krause@kdab.com>
References: <1416254561-12691-1-git-send-email-volker.krause@kdab.com>
Message-ID: <546FD745.3050004@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Volker,

Le 17/11/2014 21:02, Volker Krause a ?crit :
> This is rarely needed by packages, but convenient to have when it is.
> 
> Signed-off-by: Volker Krause <volker.krause@kdab.com>
> ---
> Changes v2 -> v3:
>   - fixed endianess handling for ARM v4-v7
>   - coding style
> 
> Changes v1 -> v2:
>   - added missing qstrip
>   - set the correct ARM variant as done in
>     http://patchwork.ozlabs.org/patch/408501/
> 

Openpowerlink package compiled with your patch and [1] applied.

Reviewed-by: Romain Naour <romain.naour@openwide.fr>

[1] http://patchwork.ozlabs.org/patch/413219/

Best regards,
Romain
