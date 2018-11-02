From: Serj Kalichev <serj.kalichev@gmail.com>
Date: Fri, 2 Nov 2018 14:36:04 +0300
Subject: [Buildroot] [PATCH 1/1] support/scripts/mkmakefile: Silent
 wrapper
In-Reply-To: <20181101204441.GW28575@scaer>
References: <20181026112621.8146-1-serj.kalichev@gmail.com>
 <20181101204441.GW28575@scaer>
Message-ID: <4058cf9b-11ef-8c4b-9624-4864840f7c12@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

01.11.2018 23:44, Yann E. MORIN ?????:
> The default would be to be silent (what you expect), while still
> allowing people like me to turn on the verbose mode when needed.
>
Yes, it's better solution. I have changed the patch. See patch v2
