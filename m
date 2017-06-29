From: Fabio Estevam <festevam@gmail.com>
Date: Thu, 29 Jun 2017 14:44:48 -0300
Subject: [Buildroot] : gstreamer-imx issue with missing VP8 decoder
In-Reply-To: <CAD6G_RT4V7evd7nxBo5thc+ysfmwqff5J7tZew+ZgR_=K5=-GQ@mail.gmail.com>
References: <CAMty3ZBK15PiFMmxp3D6vB9wukXzVgds4z4zoNSg=6cOTT-0PA@mail.gmail.com>
 <CAOMZO5CvVSM0zZpnPfa2i9e289KVuQqN0Xu_9iDWYA2pmw-PyA@mail.gmail.com>
 <CAD6G_RRAsBWnWcTEcFaHmssnqqfwStkWZtGB=tgWT_ocevf_qQ@mail.gmail.com>
 <CAOMZO5C=4hWHfeDVK+fmAP9bp1akQ-J01z5WAeK=r9GzG39g_A@mail.gmail.com>
 <CAD6G_RT4V7evd7nxBo5thc+ysfmwqff5J7tZew+ZgR_=K5=-GQ@mail.gmail.com>
Message-ID: <CAOMZO5A43-tQhV45fVUng7cg=ECGcXMqvFBDwrqw+ArY7ZYqLQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Jagan,

On Thu, Jun 29, 2017 at 2:04 PM, Jagan Teki <jagannadh.teki@gmail.com> wrote:

> OK, now I moved with Gsteamer.
>
> Now I'm observing  an Error while playbin

Has the coda driver been properly loaded? Did you pass the VPU firmware?

I suggest you to start a thread at
gstreamer-devel at lists.freedesktop.org as this is not something related
to Buildroot.
