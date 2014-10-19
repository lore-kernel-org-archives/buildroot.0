From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun, 19 Oct 2014 10:38:35 -0300
Subject: [Buildroot] [PATCH 6/6] tar: bump to version 1.28
In-Reply-To: <543D9172.7030700@mind.be>
References: <1413284044-20381-1-git-send-email-gustavo@zacarias.com.ar>	<1413284044-20381-6-git-send-email-gustavo@zacarias.com.ar>
 <87bnper9dy.fsf@dell.be.48ers.dk> <543D4035.5050308@zacarias.com.ar>
 <543D9172.7030700@mind.be>
Message-ID: <5443BEDB.4060603@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 10/14/2014 06:11 PM, Arnout Vandecappelle wrote:

>  In that case, you should probably not add them to buildroot but instead do
> 
> TAR_PATCH = http://git.savannah.gnu.org/cgit/tar.git/patch/?id=e9ddc08da0982f36581ae5a8c7763453ff41cfe8
> 
> no?

That leads to particularly odd filenames on disk:
?id=e9ddc08da0982f36581ae5a8c7763453ff41cfe8
There's no inherent problem with that but looks pretty stray-y to me (no
package name identification).
It's also not the usual way.
I'll adjust the in-tree patch instead.
Regards.
