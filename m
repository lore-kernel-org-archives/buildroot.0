From: Samuel Martin <s.martin49@gmail.com>
Date: Thu, 7 Feb 2013 15:44:48 +0100
Subject: [Buildroot] [PATCH 5/5] libgpg-error: use <pkg>_CONFIG_SCRIPTS
In-Reply-To: <1360192218-30930-6-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1360192218-30930-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1360192218-30930-6-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <CAHXCMM+_tNwWDoZy4k4GH77O_q7Hs+b=EMfMPjXZm-kMtvbt9g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2013/2/7 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>:
> libgpg-error installs a gpg-error-config script, but it wasn't fixed
> up properly. Use the <pkg>_CONFIG_SCRIPTS to handle this.
>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: "Samuel Martin" <s.martin49@gmail.com>


-- 
Samuel
