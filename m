From: Sam Voss <sam.voss@rockwellcollins.com>
Date: Mon, 30 Oct 2017 09:27:17 -0500
Subject: [Buildroot] [PATCH v2 1/2] package/libssh2: Add selectable
	crypto libraries
In-Reply-To: <20171030051949.n2w5iprgp6cv5zg2@sapphire.tkos.co.il>
References: <1509054225-19795-1-git-send-email-sam.voss@rockwellcollins.com>
 <20171030051949.n2w5iprgp6cv5zg2@sapphire.tkos.co.il>
Message-ID: <CAH=K+6m_PJy-kk8TkTgfgL=UpqXeYhKYs5Czaje2yjdSTg1w0w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Baruch, All,

On Mon, Oct 30, 2017 at 12:19 AM, Baruch Siach <baruch@tkos.co.il> wrote:
[...]
> Have you tested combination of options after the version bump in the next
> patch?

Could you elaborate on this? I don't understand what you mean by
combination of options.

>
> The master libssh2 branch changes the configure crypto selection options to
> --with-crypto=auto|openssl|libgcrypt|mbedtls. You should either take this into
> account in the version bump patch, or (preferably, IMO) reverse the patches
> order, change to --with-crypto in the version bump patch, and add selectable
> crypto backend in the second.

Good catch, I didn't catch this in the diffs. I will look into these options.

Sam
