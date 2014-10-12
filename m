From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Sun, 12 Oct 2014 09:41:59 -0500
Subject: [Buildroot] Topics to discuss at the meeting
In-Reply-To: <20141008105653.7252facd@free-electrons.com>
References: <20141008105653.7252facd@free-electrons.com>
Message-ID: <CANQCQpZeC6ds2btYrge5_CGHWXOeTLjfv+hYX1n1ynW7m6C=FA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I'm unable to listen to the discussion this weekend, but I'd be curious
where discussions on atomic operations go.
On Oct 8, 2014 3:57 AM, "Thomas Petazzoni" <
thomas.petazzoni@free-electrons.com> wrote:

> Hello,
>
> The meeting is approaching, so to foster some preliminary discussion,
> here is the current list of topics we have in the Wiki:
>
>  - Look-back to action points from previous developer days at Fosdem
>    2014: is everything that was decided done? What remains?
>
>  - Patch naming: current convention is
>    package-number-description.patch, but a proposal was made on the
>    list to simplify this to number-description.patch. Go or no-go?
>
>  - Since Luca will be present: state of legal-info infrastructure,
>    improvements to be made?
>
>    - Could more details be added here (by Thomas DS, who proposed the
>      topic)
>
>  - Discussion on atomic operations and how to handle the related
>    dependencies at the kconfig level
>
>  - Cleanup the patchwork; triage patches in two categories:
>
>    - things that hasn't been pushed enough but that we believe is useful
>
>    - things that haven't been pushed enough and that are too anecdotic
>      for us to care about
>
>  - Pending large series:
>
>    - The paranoid wrapper series from Thomas P.
>    - The march/mcpu conflict on ARM series from Thomas P.
>    - The Qemu series from Yann
>    - The freerdp series from Yann
>    - The NVidia series from Yann
>    - The OpenCV series from Samuel
>    - The apr-util/apache series from Bernd
>    - The gendoc series from Yann (IMPORTANT)
>    - The X.org/i.MX6 series from J?r?me
>    - The libudev series from Yann (IMPORTANT)
>
>  - Key-signing party: it would be usefull to have a web-of-trust
>    amongst Buildroot developpers, to submit sensitive information, such
>    as the hashes.
>
>  - Project maintenance:
>
>    - Peter seems to be less active now
>
>    - Thomas (who acts as deputy committer) has new responsibilities,
>      and risks being less available too
>
>   - How do we see the short- and long-term maintenance of the project?
>
>  - Should we move buildroot.org to its own server, and split from
>    busybox.net and uclibc.org?
>
> Feel free to comment on these topics, or add new ones. For those who
> have an account, do not hesitate to update the Wiki accordingly.
>
> Thanks,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20141012/b9402fb1/attachment.html>
