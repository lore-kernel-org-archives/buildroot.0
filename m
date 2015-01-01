From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Thu, 1 Jan 2015 19:01:14 +0100
Subject: [Buildroot] [PATCH] svgtiny: update source url
In-Reply-To: <20141231180633.000dea5e@free-electrons.com>
References: <1420018280-28316-1-git-send-email-fabio.porcedda@gmail.com>
 <20141231180633.000dea5e@free-electrons.com>
Message-ID: <CAHkwnC9yUAK_Oq4Xr_gP5FsPU8Cw_Sa+g2gzTzHnYV3Y+yaxfQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Dec 31, 2014 at 6:06 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Fabio Porcedda,
>
> On Wed, 31 Dec 2014 10:31:20 +0100, Fabio Porcedda wrote:
>> As source url use the git repository instead of the unavaiable svn
>> repository.
>>
>> This fix the following error:
>>
>> svn: E670002: Unable to connect to a repository at URL 'svn://svn.netsurf-browser.org/trunk/libsvgtiny'
>> svn: E670002: Unknown hostname 'svn.netsurf-browser.org'
>>
>> Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
>> Cc: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
>> ---
>>  package/libsvgtiny/libsvgtiny.mk | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> In the end, I reverted your change, it was causing build failures since
> some files are apparently missing from the Git repository. See
>
>   http://autobuild.buildroot.org/results/242/24257e9739df8f589150336cb6213812516bf465/
>
> Can you have a look?

I'm sorry, I will look at it.

BR
-- 
Fabio Porcedda
