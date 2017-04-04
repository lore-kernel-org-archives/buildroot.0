From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 4 Apr 2017 22:01:36 +0200
Subject: [Buildroot] [PATCH 1/2] mosquitto: bump to version 1.4.11
In-Reply-To: <1491334650-15708-1-git-send-email-fontaine.fabrice@gmail.com>
References: <1491334650-15708-1-git-send-email-fontaine.fabrice@gmail.com>
Message-ID: <20170404220136.53846968@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  4 Apr 2017 21:37:29 +0200, Fabrice Fontaine wrote:
>  - This version requires a patch (sent upstream) to remove -lanl from
> all Linux builds as this library is only needed for adns support

And so how does it work when adns support is enabled, by your PATCH
2/2 ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
