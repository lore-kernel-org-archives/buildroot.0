From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Tue, 12 Mar 2013 10:16:17 +0100
Subject: [Buildroot] [PATCH] pkg-autotools.mk: remove extra space from
 config-update message
In-Reply-To: <20130312084157.4528e185@skate>
References: <1363053511-9208-1-git-send-email-danomimanchego123@gmail.com>
 <20130312084157.4528e185@skate>
Message-ID: <CAAXf6LW_YCuORrWj7j352RkgO-Mhbs=D_4jKddCQ=htQO48zCg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Mar 12, 2013 at 8:41 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Danomi Manchego,
>
> On Mon, 11 Mar 2013 21:58:31 -0400, Danomi Manchego wrote:
>> If you do a "make -s", you will notice that the UPDATE_CONFIG_HOOK message
>> has an extra space compared to other highlighted messages.  For example:
>>
>> >>> util-linux 2.20.1  Updating config.sub and config.guess
>> >>> util-linux 2.20.1 Patching libtool
>> >>> util-linux 2.20.1 Autoreconfiguring
>>
>> A grep shows this is the only instance of the extra space. This patch
>> removes the extra space.
>>
>> Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
>
> Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Acked-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
