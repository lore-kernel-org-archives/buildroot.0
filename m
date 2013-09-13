From: Ryan Barnett <rjbarnet@rockwellcollins.com>
Date: Fri, 13 Sep 2013 11:41:41 -0500
Subject: [Buildroot] [RFC] Effective Patchwork Use and Patch Review
Message-ID: <OFD77E15AC.FCFBC1CA-ON86257BE5.005BB4D9-86257BE5.005BB4FE@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas De Schampheleire, all,

In the massive thread that has become [PATCH 0/3] Support for
out-of-tree Buildroot customization, Thomas De Schampheleire
brought up the following:

Thomas De Schampheleire <patrickdepinguin@gmail.com> wrote on
09/13/2013 02:35:04 AM:

> 2. sometimes patches get very little, if any, response. Especially in
> the beginning of my contributions, this was very frustrating. I pinged
> patches, re-sent them, even multiple times, and still not even a
> comment was given. I can imagine that not everyone continues trying,
> and several people will just give up, tagging the buildroot community
> as 'not accepting patches'.

> The situation has certainly improved since then, I think: the
> introduction of patchwork helps keeping track of open patches, and
> although I have not kept numbers I think the community certainly has
> grown, and there are now several more people systematically reviewing
> patches so that the burden does not fall entirely on Peter and
> yourself.

> I think we should still keep an eye on this though. I think it still
> happens that patches are sent by 'new' people in the community, and
> there is little or no reaction. Sometimes the patch does not really
> fit in our general belief of how buildroot should be, but maybe we
> don't always dare to say it. Or sometimes the patch is so specific
> that it is hard to  give a good review, so one waits until someone
> else with more experience in that area gives some comments, which may
> never happen.

> Ideally, patches should stay no longer than a fixed amount of time in
> patchwork. Either the patch is given some comments and we
> wait/encourage for the submitter to send an updated version, or we
> reject the patch with some explanation, or we ask more details so we
> can either accept/reject it with more background. This may not be
> feasible for all patches. Sometimes there is simply no-one who really
> needs the extra feature/fix except the submitter himself, but that is
> not necessarily a reason not to accept the patch.

One thing that I've found difficult is finding an effective way for
someone new to buildroot community to perform reviews on patches they
find of interest. What I mean by effective is a way that takes little
time to pull the patch down and then mark it up for review and send it
back out. Our email client in my work environment isn't ideal.
However, we do have ways of sending email directly using git-email.

The thing is that I haven't been able find good documentation on how
to effectively use Patchworks for review (pwclient). I don't
necessarily need someone to tell me how to exactly use it but rather
maybe an example workflow for interacting with patchworks with
"pwclient" and maybe some example helper scripts for formatting
replies to these patches.

So I guess the two things that I would like to see eventually be
addressed by provide a little more detail some how are:

1) Guidelines for providing reviews comments on patches

2) Some examples of how to effectively use patchworks for reviewing

If somebody is willing to chime in on this, I can maybe look to
document this feedback under the contributing to buildroot section
of the manual.

------------------------------------------------------------
Ryan J Barnett / Software Engineer / Platform SW
MS 137-157, 855 35th St NE, Cedar Rapids, IA, 52498-3161, US
Phone: 319-263-3880 / VPN: 263-3880 
rjbarnet at rockwellcollins.com
www.rockwellcollins.com

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130913/a48433a2/attachment.html>
