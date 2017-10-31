From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 31 Oct 2017 21:15:34 +0100
Subject: [Buildroot] [PATCH v3 2/2] package/libssh2: Add selectable
 crypto libraries
In-Reply-To: <1509465218-55386-2-git-send-email-sam.voss@rockwellcollins.com>
References: <1509465218-55386-1-git-send-email-sam.voss@rockwellcollins.com>
 <1509465218-55386-2-git-send-email-sam.voss@rockwellcollins.com>
Message-ID: <20171031211534.0ca086cd@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 31 Oct 2017 10:53:38 -0500, Sam Voss wrote:
> Add functionality to allow crypto libraries for libssh2 to be selectable
> by a choice instead of a fallback that may not work in all cases.

Is it possible to have a better justification that "may not work in all
cases" ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
