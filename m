From: Julien Boibessot <julien.boibessot@free.fr>
Date: Mon, 17 Sep 2007 21:44:18 +0200
Subject: [Buildroot] buildroot with ipkg
In-Reply-To: <7fc538d30709170509s4898cc55keb14ebb718d30090@mail.gmail.com>
References: <7fc538d30709170509s4898cc55keb14ebb718d30090@mail.gmail.com>
Message-ID: <46EED912.2070902@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

pasteur a ?crit :
> any idea about ipkg integration with buildroot ? Like openwrt...
>   
I have started to integrate it for a project I'm co-driving but from my 
understanding it will require to modify each package's makefile to 
explicitly call "ipkg stuff" after having installed the package's files 
in TARGET_DIR.

Do you have a better idea ?

Regards,
Julien
