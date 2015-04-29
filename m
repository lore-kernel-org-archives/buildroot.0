From: Samuel Martin <s.martin49@gmail.com>
Date: Wed, 29 Apr 2015 17:36:56 +0200
Subject: [Buildroot] [PATCH 1/1] libwebsockets: add LWS_ prefix to
 LWS_WITHOUT_TESTAPPS=ON cmake option
In-Reply-To: <1430314740-6112-1-git-send-email-baptiste.moraine@kapelse.com>
References: <1430314740-6112-1-git-send-email-baptiste.moraine@kapelse.com>
Message-ID: <CAHXCMMLgHHnFPKLZYfNFToCZAzcN2Ur=715-99mJ8aHOvtYL2A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Apr 29, 2015 at 3:39 PM, Baptiste Moraine
<baptiste.moraine@kapelse.com> wrote:
> Currently, libwebsockets.mk is passing -DWITHOUT_TESTAPPS=ON to disable
> the building of libwebsockets test applications, but this is doing nothing
> because the option is really named  LWS_WITHOUT_TESTAPPS.
> This commit fixes that by using the correct option name.
>
> Signed-off-by: Baptiste Moraine <baptiste.moraine@kapelse.com>
Reviewed-by: Samuel Martin <s.martin49@gmail.com>

Regards,

-- 
Samuel
