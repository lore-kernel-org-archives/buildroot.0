From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 16 Mar 2012 00:18:44 +0100
Subject: [Buildroot] [PATCH] User defined configuration file name
In-Reply-To: <CAMkyJgBx7VKJ9=iDyUYgez_Nc2DHARRz7V5in_8R3BuEfJKbpg@mail.gmail.com>
References: <CAMkyJgBx7VKJ9=iDyUYgez_Nc2DHARRz7V5in_8R3BuEfJKbpg@mail.gmail.com>
Message-ID: <201203160018.44486.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Friday 09 March 2012 00:02:57 Avishay Orpaz wrote:
> Allow using a configuration file other than the default .config by setting
> the DOTCONFIG variable

 Why would you want to do that?

 If the goal is to switch easily between two configurations, I suggest 
using two output directories instead.  And if the idea is to store
several configurations in your version control system, put them in
the configs directory and use them with 'make xxx_defconfig'.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
