From: Romain Naour <romain.naour@openwide.fr>
Date: Sat, 15 Nov 2014 18:52:35 +0100
Subject: [Buildroot] [PATCH 1/1] pkg-cmake.mk: Set
	CMAKE_SYSTEM_PROCESSOR.
In-Reply-To: <CAHXCMM+WdJe+pHi4GNi7QT9Vd=43LoRzXhU05byPPZ5uLRT=Ww@mail.gmail.com>
References: <1416067219-30211-1-git-send-email-volker.krause@kdab.com>
 <CAHXCMM+WdJe+pHi4GNi7QT9Vd=43LoRzXhU05byPPZ5uLRT=Ww@mail.gmail.com>
Message-ID: <546792E3.5060007@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Volker,

Le 15/11/2014 18:26, Samuel Martin a ?crit :
> Hi Volker,
> 
> On Sat, Nov 15, 2014 at 5:00 PM, Volker Krause <volker.krause@kdab.com> wrote:
>> This is rarely needed by packages, but convenient to have when it is.
>>

There is only one package (openpowerlink) that set this variable in buildroot
and the expected value is "x86" or "x86_64".

Are you sure that the BR2_ARCH can be used by other packages that need
CMAKE_SYSTEM_PROCESSOR ?
If so, I can send a patch for openpowerlink to fix that.

Best regards,
Romain Naour
