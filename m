From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Fri, 14 Dec 2018 21:25:18 -0600
Subject: [Buildroot] [autobuild.buildroot.net] Your build results for
 2018-12-13
In-Reply-To: <543443774.3025390.1544838391325.JavaMail.zimbra@datacom.com.br>
References: <20181214070028.28AC620DDA@mail.bootlin.com>
 <543443774.3025390.1544838391325.JavaMail.zimbra@datacom.com.br>
Message-ID: <CANQCQpYHjZLOSWFHJ6GS3WcgP8q9NWh-TFCEsNjMGaNkiGaHKg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Carlos,

On Fri, Dec 14, 2018 at 7:46 PM Carlos Santos <casantos@datacom.com.br> wrote:
>
[snip]
>
> >      xtensa |                util-linux-2.33 | http://autobuild.buildroot.net/results/12b108a6185ab96a0eb509ab0e6fe053e545c77b
>
> I can't reproduce it locally. Looks like a host glitch, since fails in
> the installation.
>

I'll see if I can reproduce outside of the container that the builder
runs in.  It looks like the Buildroot step_check_build_dir is catching
an invalid install path where my home dir is getting used as a install
path in the sysroot

Matt
