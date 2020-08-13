From: Christian Stewart <christian@paral.in>
Date: Thu, 13 Aug 2020 12:39:10 -0700
Subject: [Buildroot] [PATCH 1/4] package/mender-artifact: bump version
 to 3.4.0
In-Reply-To: <CAFSsvmqzkM2N2syEMc1AZeeRdvQ-HRtkK4zFSOp3q-qumYmCKQ@mail.gmail.com>
References: <20200715173707.584226-1-aduskett@gmail.com>
 <20200811235833.03115c8b@windsurf.home>
 <CA+h8R2qLY-5FbL_HTjwTH_i=w3ky_=C=17n48_=18-E=9mUYVg@mail.gmail.com>
 <20200812102236.631c057f@windsurf.home>
 <CAFSsvmqzkM2N2syEMc1AZeeRdvQ-HRtkK4zFSOp3q-qumYmCKQ@mail.gmail.com>
Message-ID: <CA+h8R2oxbeA9Fcfs-aEjpWb_4QC7WbijYW5hm84GAvC3iWP00w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Don't merge. This will download stuff out-of-band with the main
Buildroot download mechanism.

On Thu, Aug 13, 2020 at 11:52 AM Adam Duskett <aduskett@gmail.com> wrote:
> I submitted a patch based on Mirza's suggestion above which works as expected:
> https://patchwork.ozlabs.org/project/buildroot/patch/20200813184947.4042927-1-aduskett at gmail.com/

> > Do we have an intermediate solution for 2020.08 ? Would reverting the
> > mender-artifact bump resolve the issue ?

Please just roll it back and then consider the full Go modules patch later on.

I went about submitting that series in a particular way to avoid
breaking the Buildroot download system.

Best regards,
Christian Stewart
