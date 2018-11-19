From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Mon, 19 Nov 2018 07:03:05 -0600
Subject: [Buildroot] [PATCH] package/xproto_inputproto: disable
 documentation
In-Reply-To: <87lg5pld2t.fsf@dell.be.48ers.dk>
References: <1542596449-55950-1-git-send-email-matthew.weber@rockwellcollins.com>
 <87lg5pld2t.fsf@dell.be.48ers.dk>
Message-ID: <CANQCQpZkpV1KaH_syk=98kAb1SNiNZDw=Gy+1GtsJGa_+aYAtQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter,

On Mon, Nov 19, 2018 at 1:51 AM Peter Korsgaard <peter@korsgaard.com> wrote:
>
> >>>>> "Matt" == Matt Weber <matthew.weber@rockwellcollins.com> writes:
>
>  > Resolves:
>  > http://autobuild.buildroot.net/results/e6b/e6badde04047e10023b97946bbff434abc07344d/
>
>  > Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
>
> Please clearly state when patches are for the LTS branch instead of
> master.
>

Sorry about that, didn't notice the test results were just pointing at
LTS.  It should also be applied to master as there isn't a reason we'd
want docs enabled.

Matt
