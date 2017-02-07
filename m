From: Samuel Martin <s.martin49@gmail.com>
Date: Tue, 7 Feb 2017 15:32:33 +0100
Subject: [Buildroot] [PATCH v5 02/19] fakedate: new package
In-Reply-To: <1482241596-31688-3-git-send-email-jezz@sysmic.org>
References: <1482241596-31688-1-git-send-email-jezz@sysmic.org>
 <1482241596-31688-3-git-send-email-jezz@sysmic.org>
Message-ID: <CAHXCMMK2Uoksvr4Wh1pP-AtqKdnk7NdSG3mwKe1whwnYJwuOBQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi J?r?me, all,

On Tue, Dec 20, 2016 at 2:46 PM, J?r?me Pouiller <jezz@sysmic.org> wrote:
> `date' is widely used by packages to include build information in their
> binaries. Unfortunately, this is incompatible with  BR2_REPRODUCIBLE.
>
> Instead of having to identify all `date' invocations in the different
> packages, this commit adds a small tool that allows to always return
> the same date.
>
> This work was sponsored by `BA Robotic Systems'.
>
> Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>

Reviewed-by: Samuel Martin <s.martin49@gmail.com>

Regards,

-- 
Samuel
