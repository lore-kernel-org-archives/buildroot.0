From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 19 Jan 2021 08:06:27 +0100
Subject: [Buildroot] Buildroot on Windows Subsystem for Linux (WSL)
In-Reply-To: <CA+h8R2oGKpEX8fwJw6SHHbQnV7uvcZkArz3X8m_5Sk39U5PbLA@mail.gmail.com>
 (Christian Stewart's message of "Mon, 18 Jan 2021 19:52:30 -0800")
References: <87h7njrilt.fsf@paral.in> <878s8qf1cm.fsf@dell.be.48ers.dk>
 <CA+h8R2oGKpEX8fwJw6SHHbQnV7uvcZkArz3X8m_5Sk39U5PbLA@mail.gmail.com>
Message-ID: <87ft2xe77w.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Christian" == Christian Stewart <christian@paral.in> writes:

 > Hi Peter,
 > On Mon, Jan 18, 2021 at 12:15 PM Peter Korsgaard <peter@korsgaard.com> wrote:
 >> 
 >> >>>>> "Christian" == Christian Stewart <christian@paral.in> writes:
 >> > The Buildroot system works as expected in the WSL environment. The
 >> > buildroot output tar.gz can be imported directly into WSL 2.0. WSL 1.0
 >> > requires using the WSL-DistroLauncher project to load the distribution
 >> > via a Windows Appx.
 >> 
 >> > This is an interesting way to use Buildroot under Windows.
 >> 
 >> Cute. Besides the fact that you are booting a (heavily patched) Linux
 >> kernel, is there any specific advantages to just creating a docker
 >> container or a classic VM from a Buildroot build?

 > By my (limited) understanding, WSL2 promises tighter integration
 > between Linux and the Windows OS.

 > I haven't tested it, but docs say you can override the kernel image.

You haven't tested it? Didn't the defconfig you point to build a Linux
kernel as well?

-- 
Bye, Peter Korsgaard
