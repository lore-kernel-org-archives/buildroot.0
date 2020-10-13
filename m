From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Tue, 13 Oct 2020 09:50:04 -0500
Subject: [Buildroot] [PATCH 1/2] package/libtalloc: new package
In-Reply-To: <20201013143707.11678-1-dgouarin@gmail.com>
References: <20201013143707.11678-1-dgouarin@gmail.com>
Message-ID: <CANQCQpZYXMoVqZVsNGJ-cOnXp0NeVnmA-H1_ofrMsDt9uNcQVg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

David,


On Tue, Oct 13, 2020 at 9:38 AM David GOUARIN <dgouarin@gmail.com> wrote:
>
> talloc is a hierarchical, reference counted memory pool system with destructors.
> It is the core memory allocator used in Samba.
>

Thanks for sending this David, for reference there is a pending
libtalloc patch that might be worth comparing to yours.

http://patchwork.ozlabs.org/project/buildroot/patch/20200327150225.15277-1-jared.bents at rockwellcollins.com/

Best Regards,
Matt
