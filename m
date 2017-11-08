From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Wed, 8 Nov 2017 13:36:23 -0600
Subject: [Buildroot] [PATCH v3 1/1] refpolicy: bump to 2.20170805
In-Reply-To: <20171107144915.32423-1-Adamduskett@outlook.com>
References: <20171107144915.32423-1-Adamduskett@outlook.com>
Message-ID: <CANQCQpbe8w17u-ZbGP_WBvRn9NxgF3xDgWRC9d_3v0oRrNxZhQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Adam,

On Tue, Nov 7, 2017 at 8:49 AM, Adam Duskett <aduskett@gmail.com> wrote:
> In addition to a simple bump, the following extra changes have occured:
>   - Change the refpolicy site to the official release URL.
>   - Remove REFPOLICY_SITE_METHOD and REFPOLICY_GIT_SUBMODULES as the contrib
>     submodule is included in the release tarball.
>   - Refpolicy is now compatible with python3, as such, remove host-python.
>     from the dependencies and add a check for python3 or python in it's place.
>   - Add upstreamed 0001-fix-regex-escape-sequence-error.patch to fix building
>     against python3.6.
>   - Add sha256 license hash to hash file.
>
> Signed-off-by: Adam Duskett <Adamduskett@outlook.com>

Tested-by: Matt Weber <matthew.weber@rockwellcollins.com>
