From: Patrick Doyle <wpdster@gmail.com>
Date: Tue, 12 Feb 2019 12:28:27 -0500
Subject: [Buildroot] make: write error: stdout
In-Reply-To: <878sylwagf.fsf@dell.be.48ers.dk>
References: <CAF_dkJB9s1Um95exFi70ucmr4t3bmUohhm2dcj5558n7cuEdcg@mail.gmail.com>
 <878sylwagf.fsf@dell.be.48ers.dk>
Message-ID: <CAF_dkJCF16k9pBVdadg9VQAXtfkRC_r81bRFR2MJmvOhte7eXQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Feb 12, 2019 at 5:46 AM Peter Korsgaard <peter@korsgaard.com> wrote:
> Funky. It does sound like a Ubuntu specific kernel bug that we cannot
> really do anything about. Please let us know if bug 1814393 gets
> updated.

I would encourage any all of us who are affected by this problem to
visit https://bugs.launchpad.net/ubuntu/+source/linux-signed/+bug/1814393
and click on the "This affects me" button.  That's the most influence
(and insight) I have into getting this fixed :-)

In the mean time, i have rolled back to my 4.15.0.43 kernel and am
back to being able to build again.

--wpd
