From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 14 Apr 2014 18:33:37 -0300
Subject: [Buildroot] jquery related things
In-Reply-To: <534C4FCF.2010701@zacarias.com.ar>
References: <20140414230650.4ca18edc@skate> <534C4FCF.2010701@zacarias.com.ar>
Message-ID: <534C5431.9010905@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/14/2014 06:14 PM, Gustavo Zacarias wrote:

> On 04/14/2014 06:06 PM, Thomas Petazzoni wrote:
> 
>> Hello Gustavo,
>>
>> Since you have recently bumped jquery-ui, can you look into:
>>
>>   http://autobuild.buildroot.org/results/7d8/7d892f06f431ca51dd711b7aa7e850bebc266ab9/build-end.log
> 
> Hi.
> Well hello upstream!
> 
> This from my stable srcs repo...
> 3026247 Jan 17 14:59 jquery-ui-1.10.4.zip
> ain't this...
> 2032866 Apr  8 09:16 jquery-ui-1.10.4.zip
> 
> I'll try to find out what happened.

Well there's a third version around, the one in google ajax
libraries/microsoft ajax cdn, same size as mine (min.js) but differing hash.
The one from jquery.com at least has a newer timestamp (in the header).
So basically the directory structure in the zipfiles changed, sizes
changed and of course hashes with it, but for CDN versions (which are
basically the bare text files) there were no changes except the hash
compared to mine/the original.
No announcements or anything whatsover unfortunately.
Regards.
