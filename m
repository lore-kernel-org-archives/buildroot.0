From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 28 May 2013 09:25:15 +0200
Subject: [Buildroot] Issue with the autobuilders: removing 1379 builds
 from the history?
In-Reply-To: <20130528091052.16da9159@skate>
References: <20130528091052.16da9159@skate>
Message-ID: <20130528072515.GA3510@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2013-05-28 09:10 +0200, Thomas Petazzoni spake thusly:
> While trying to reproduce the flex recent issue that triggered in the
> autobuilders, I found out that I couldn't reproduce it. After
> investigating, I discovered that the Git commit id being reported by my
> autobuilder machine was incorrect. This is due to a change I made in
> the autobuilder on May, 13th, where I'm now using a separate Git tree
> for each build instead of a common one, but the script was still taking
> the Git commit id of some other Buildroot tree. So the build was
> actually taking place with the latest Buildroot version, but reported
> to use Git commit id 9947ee9fbb94af800b8b054262734e0f81f32250.
[--SNIP--]
> Therefore, I am considering removing those completely bogus build
> results from the history. We are talking about removing 1379 build
> results, i.e all builds done my autobuilder between May, 14th and today.
> 
> Even though it is quite annoying to lose so many results, I believe
> this is the best action we can take now.

No point in keeping those since we can't reproduce them, I'd say.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
