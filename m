From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 29 Mar 2017 23:28:33 +0200
Subject: [Buildroot] [PATCH v4] dc3dd: new package
In-Reply-To: <1490603530-12631-1-git-send-email-benoit.allard@greenbone.net>
References: <1489069259-4866-1-git-send-email-benoit.allard@greenbone.net>
 <1490603530-12631-1-git-send-email-benoit.allard@greenbone.net>
Message-ID: <20170329232833.086eda51@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 27 Mar 2017 10:32:10 +0200, Beno?t Allard wrote:
> We actually prefer the version 7.2.641 (over 7.2.646) as the
> content of the release is identical and the 641 has the advantage
> of providing a proper .tar.xz file.
> 
> Signed-off-by: Beno?t Allard <benoit.allard@greenbone.net>
> ---
> Changes v1 -> v2 (Suggestions by Arnoud)
>    - Fix line lengths in Config.in
>    - Add a locally calculated sha256
>    - Use a version that has a proper tar.xz file
>    - Correct license to be GPLv3+
>    - Add patch to not build the manpage
> Changes v2 -> v3
>    - Add dependency on THREADS
>    - Add conflict with musl
> Changes v3 -> v4
>    - Fix the alphabetical order in Config.in (Suggestion by Jerzy)
>    - Add MAJOR variable in mk file (Suggestion by Jerzy)
>    - patch the Makefile.am file and add autoreconf (Suggestion by Thomas)
>    - Add a comment about the thread dependency in Config.in (Suggestion by Thomas)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
