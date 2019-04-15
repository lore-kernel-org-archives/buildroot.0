From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 15 Apr 2019 23:10:51 +0200
Subject: [Buildroot] [PATCH 1/2] package/wireshark: bump to version 3.0.1
In-Reply-To: <CAPi7W80zMaCXPWu5OPVtOG8S0paGxr-w7=pkx6PJsGusY5U84g@mail.gmail.com>
References: <20190415161058.14182-1-fontaine.fabrice@gmail.com>
 <5b69b1a1-181f-278c-303d-c58772bc5a78@mind.be>
 <CAPi7W80zMaCXPWu5OPVtOG8S0paGxr-w7=pkx6PJsGusY5U84g@mail.gmail.com>
Message-ID: <98ac2dac-09bc-4cb9-376e-24cb802f01c2@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 15/04/2019 22:38, Fabrice Fontaine wrote:
>>> +     depends on BR2_INSTALL_LIBSTDCPP
>>> +     depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
>>> +     depends on BR2_PACKAGE_HAS_UDEV
>>  Could you add # reason markers here?
> Yes, I can add "# runtime" (without it, Qt does not manage
> keyboard/mouse events). Actually, I hesitated to add a reason as I saw
> that most packages having udev dependency didn't have a reason.

 Sorry, I actually meant the other two (libstdcpp and nptl). I assume they're
only needed because of the select of qt5.

 Regards,
 Arnout
