From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Wed, 8 Oct 2014 11:10:25 +0200
Subject: [Buildroot] Topics to discuss at the meeting
In-Reply-To: <20141008105653.7252facd@free-electrons.com>
References: <20141008105653.7252facd@free-electrons.com>
Message-ID: <CAGm1_kvhqNy_3BKg2figgWw-FbCcBTAGxrXWJm3wUwv=e42sMQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Oct 8, 2014 at 10:56 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
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

Could we add FIT topic? Basic creation and installation is already
implemented (http://patchwork.ozlabs.org/patch/396240/). The bigger
part is to control the priorities when and what step should be taken
first: at fist cpio and then fit, first fit and then ext2 etc.
I doubt, that ROOTFS_$(FSTYPE)_PRE_GEN_HOOKS and
ROOTFS_$(FSTYPE)_POST_TARGETS will help here.

Yegor
