From: Samuel Martin <s.martin49@gmail.com>
Date: Sat, 7 Mar 2015 12:52:21 +0100
Subject: [Buildroot] [PATCH 3/5] crda: remove static library handling
In-Reply-To: <1425728422-14113-4-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1425728422-14113-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1425728422-14113-4-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <CAHXCMMLf0bt8LfU79AMdzRgeXsB8=z1T-uQZHukWQmcxNTTARQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Mar 7, 2015 at 12:40 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
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
Acked-by: Samuel Martin <s.martin49@gmail.com>

Regards,


-- 
Samuel
