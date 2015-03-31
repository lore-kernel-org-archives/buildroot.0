From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 31 Mar 2015 23:46:26 +0200
Subject: [Buildroot] [PATCH 1/1] package/libseccomp: needs headers >=
 3.12
In-Reply-To: <1427819637-2471-1-git-send-email-bernd.kuhls@t-online.de>
References: <1427819637-2471-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20150331234626.045d04b4@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Tue, 31 Mar 2015 18:33:57 +0200, Bernd Kuhls wrote:

> +comment "libseccomp needs headers >= 3.12"

This should have been "libseccomp needs a tpolchain w/ headers >= 3.12"

I've committed your patch. Baruch, if you really want to have
libseccomp on kernel olders than 3.12, do not hesitate to send a
followup patch. Since the issue was affecting the autobuilders, I
wanted to get rid of it as soon as possible.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
