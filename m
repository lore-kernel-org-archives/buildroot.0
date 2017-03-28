From: Romain Naour <romain.naour@gmail.com>
Date: Tue, 28 Mar 2017 21:49:40 +0200
Subject: [Buildroot] [PATCH] mesa3d: drop unneeded libsha1 logic from
 Config.in
In-Reply-To: <20170328214404.1003ccbb@free-electrons.com>
References: <20170328123021.18091-1-peter@korsgaard.com>
 <20170328214404.1003ccbb@free-electrons.com>
Message-ID: <46864719-9b77-2140-d5bb-937cebdbb0ff@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter, All,

Le 28/03/2017 ? 21:44, Thomas Petazzoni a ?crit :
> Hello,
> 
> On Tue, 28 Mar 2017 14:30:21 +0200, Peter Korsgaard wrote:
>> Commit 7f4e9490b647 (package/mesa3d: remove sha1 external dependency)
>> removed the --with-sha1 logic from mesa3d.mk, but didn't remove the
>> corresponding logic / comment from Config.in.
>>
>> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
>> ---
>>  package/mesa3d/Config.in | 4 ----
>>  1 file changed, 4 deletions(-)
> 
> Applied to master, thanks. Good catch!

Back on line too late to ack this patch :p

Thanks!

Romain

> 
> Thomas
> 
