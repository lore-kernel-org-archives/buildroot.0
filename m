From: Sam Voss <sam.voss@rockwellcollins.com>
Date: Wed, 1 Nov 2017 09:54:19 -0500
Subject: [Buildroot] [PATCH v5 1/2] package/libssh2: Update to newest
	version
In-Reply-To: <20171101105823.6128ce6b@windsurf>
References: <1509472591-12650-1-git-send-email-sam.voss@rockwellcollins.com>
 <20171101105823.6128ce6b@windsurf>
Message-ID: <CAH=K+6=0mqS9-S4yheRsMWkEQzCxntiS47KiFP=_xq7xYrOL6w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On Wed, Nov 1, 2017 at 4:58 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>> +
>> +Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
>> +Cc: Sam Voss <sam.voss@rockwellcollins.com>
>
> Has this patch been submitted upstream?

Yep, Yann submitted it at https://github.com/libssh2/libssh2/pull/224

>> +# autoreconf must be ran when building off git, as it has not been ran at hash
>> +LIBSSH2_AUTORECONF = YES
>
> "it has not been ran at hash" doesn't make much sense. I've simplified
> the whole comment to "building from a git clone".

I agree, poor phrasing.

Sam
