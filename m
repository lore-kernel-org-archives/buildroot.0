From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 18 Mar 2013 09:05:02 +0100
Subject: [Buildroot] X11 component versions
In-Reply-To: <CALnvph2VjwKv6U38KpR3JtWozs_zPWDzpu5stGpREuJHcdGw0Q@mail.gmail.com>
References: <CALnvph2VjwKv6U38KpR3JtWozs_zPWDzpu5stGpREuJHcdGw0Q@mail.gmail.com>
Message-ID: <5146CAAE.5060508@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

  Hi Jesper,

On 03/12/13 09:52, Jesper Birks? B?kdahl wrote:
[snip]
> I have tried to rebase the x11r7.7 patches on master. I chose not to
> remove all app components for the reasons mentioned by Nicolas Dechesne.
>
> As this is my first time contributing to buildroot, I don't know the
> procedures when dealing with this many patches at once, so for now I have
> just pushed my version of the branch to:
> https://bitbucket.org/baekdahl/buildroot/src/b8db03aa6921/?at=x11r77

  Thank you for your work. Clearly, nobody has taken a look yet :-). It 
is probably better to post the patch series to the list after all. You 
will most likely only get feedback on the first few patches, but there's 
no problem with that, right? Posting a long patch series only has the 
disadvantage of a bit more patchwork cleanup work.

  Here are some pointers about what we like to see in patches:

- Use git send-email to send them.

- Make sure all of them are Signed-off-by you, even if you didn't author 
them (just put your Sob under the original author's; cfr. Peter's Sob's 
in the git log).

- In patches which have been submitted before, add a changelog (under the 
Sob lines, separated by ---).

- Add an introductory e-mail (with git send-email --compose) explaining 
what the series is about, and indicating which parts you're less sure of 
and would like to get feedback on.


  Regards,
  Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
