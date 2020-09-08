From: Alejandro <alejandro.gonzalez.correo@gmail.com>
Date: Tue, 8 Sep 2020 15:33:41 +0200
Subject: [Buildroot] [RESEND PATCH v3 1/1] package/iputils: add configs
 to select which binaries are built
In-Reply-To: <20200903214941.536f6956@windsurf.home>
References: <20190829191722.18761-1-alejandro.gonzalez.correo@gmail.com>
 <4e8f64ec-1797-a418-79d7-701380a767db@gmail.com>
 <20200903214941.536f6956@windsurf.home>
Message-ID: <CA+wirGrjzvSunLAZ4vAYt0RudqvE_WDyPR_BAq6YjeFC4bMmzQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

El jue., 3 sept. 2020 a las 21:49, Thomas Petazzoni
(<thomas.petazzoni@bootlin.com>) escribi?:
> I have finally applied to master. The ninfod situation is now simpler
> because iputils no longer needs any external crypto library.

Neat! I lost interest over time for this patch after finding better
ways to shrink the resulting image size, but it's good to see that
finally it could be merged :)
