From: Johan Oudinet <johan.oudinet@gmail.com>
Date: Fri, 11 Jul 2014 13:41:34 +0200
Subject: [Buildroot] PACKAGE_USERS does not work
In-Reply-To: <i5np0ra770dn4ujwdmsweh48.1405067942517@email.android.com>
References: <i5np0ra770dn4ujwdmsweh48.1405067942517@email.android.com>
Message-ID: <CAJtjsKbLN1-yEkBq=cCsoaOx_n+LUYof1P51T3wzOupaxR75JQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi J?rg,

On Fri, Jul 11, 2014 at 10:57 AM, J?rg Krause <jkrause@posteo.de> wrote:
> I added a custom package (upmpdcli) to buildroot which I can cleanly build,
> except of adding a user with UPMPDCLI_USERS.
>
> I am using the same syntax as the package avahi for the definition,  where
> the user avahi is in fact added to the users table.
>
> define UPMPDCLI_USERS
> upmdpcli -1 upmpdcli -1 * - - -
> endef

Your definition of a new user looks correct to me. Could you share the
error message?

Best,
-- 
Johan
