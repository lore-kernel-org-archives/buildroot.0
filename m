From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Wed, 20 Jun 2018 16:30:57 -0500
Subject: [Buildroot] [PATCH] protobuf: bump to 3.6.0
In-Reply-To: <87muvpm9rh.fsf@dell.be.48ers.dk>
References: <20180620142255.31441-1-matthew.weber@rockwellcollins.com>
 <87muvpm9rh.fsf@dell.be.48ers.dk>
Message-ID: <CANQCQpbgdD8OjMnsGrbGsRrHbJhApyFqNsP4Bzsn5iKGJ-xseg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter,

On Wed, Jun 20, 2018 at 4:24 PM, Peter Korsgaard <peter@korsgaard.com> wrote:
>>>>>> "Matt" == Matt Weber <matthew.weber@rockwellcollins.com> writes:
>
>  > Fixes the following issue and brauto builds
>  > https://github.com/google/protobuf/issues/3937
>  > http://autobuild.buildroot.net/results/982f727495c1d3524685015c34b1cbb1e0bbb4b0
>  > http://autobuild.buildroot.net/results/adbd3088e24d7e681c995f8c3d1db0e14ac500ba
>
>  > Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
>  > ---
>  >  package/protobuf/protobuf.hash | 2 +-
>  >  package/protobuf/protobuf.mk   | 2 +-
>  >  2 files changed, 2 insertions(+), 2 deletions(-)
>
> What about python-protobuf?
>
> ERROR: No hash found for protobuf-python-3.6.0.tar.gz
> package/pkg-generic.mk:135: recipe for target '/home/peko/source/buildroot/output-wireguard/build/python-protobuf-3.6.0/.stamp_downloaded' failed

Good catch, forgot about that.  Retesting.

Matt
