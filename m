From: Aleksander Morgado <aleksander@aleksander.es>
Date: Tue, 30 Mar 2021 21:51:21 +0200
Subject: [Buildroot] [PATCH 1/2] package/libqmi: drop unrecognized option
In-Reply-To: <20210330193734.GY24043@scaer>
References: <20210329211957.321612-1-fontaine.fabrice@gmail.com>
 <CAAP7uc+qpS+Y9xN=C89jzupCH5qS2-_W_H7smrYa7SqMov57hw@mail.gmail.com>
 <20210330193734.GY24043@scaer>
Message-ID: <CAAP7ucKtYSNbPXFMAy7y6k5fLrPM7PN8cWSdSi+N9qpTwz5hJA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hey,

> > -Werror should be always implicitly
> > disabled.
>
> But there is a --disable-Werror option, and I think we should use it
> unconditionally.
>
> I've done that now, and applied to master, thanks.

That is also fine, yes :)

-- 
Aleksander
https://aleksander.es
