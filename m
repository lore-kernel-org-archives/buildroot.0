From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 7 Mar 2015 14:46:35 +0100
Subject: [Buildroot] [PATCH 3/5] crda: remove static library handling
In-Reply-To: <1425728422-14113-4-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1425728422-14113-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1425728422-14113-4-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20150307144635.255df5d6@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat,  7 Mar 2015 12:40:20 +0100, Thomas Petazzoni wrote:
> In commit d54418f2bcd9267fd049511d6236fb91c83b94ea ("crda: fix static
> build failure"), some static linking handling was added in crda. But
> in a later commit, 7c08fa935f55d108e20834e6b4bba664e1d2d408 ("crda:
> needs dynamic library support"), crda was marked as not available for
> static only builds.
> 
> This means that the static linking logic in crda.mk is now just dead
> code, so this commit gets rid of it.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Applied.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
