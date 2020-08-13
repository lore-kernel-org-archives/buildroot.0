From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 13 Aug 2020 20:34:05 +0200
Subject: [Buildroot] [PATCH 1/1] package/systemd: bump version to 245.7
In-Reply-To: <20200727181252.1334365-1-aduskett@gmail.com> (aduskett's message
 of "Mon, 27 Jul 2020 11:12:52 -0700")
References: <20200727181252.1334365-1-aduskett@gmail.com>
Message-ID: <87imdm5raa.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "aduskett" == aduskett  <aduskett@gmail.com> writes:

 > From: Adam Duskett <Aduskett@gmail.com>
 > Also drop upstream patch

 > Signed-off-by: Adam Duskett <Aduskett@gmail.com>

This fixes a security issue (CVE-2020-13776), so I've marked it as such
and applied to 2020.05.x, thanks.

-- 
Bye, Peter Korsgaard
