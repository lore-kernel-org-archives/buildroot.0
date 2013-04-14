From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun, 14 Apr 2013 20:20:15 -0300
Subject: [Buildroot] [PATCH 1/2] protobuf-c: new package
In-Reply-To: <877gk4ojsq.fsf@dell.be.48ers.dk>
References: <1365691296-16042-1-git-send-email-gustavo@zacarias.com.ar>
 <877gk4ojsq.fsf@dell.be.48ers.dk>
Message-ID: <516B39AF.4070408@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/14/2013 06:59 PM, Peter Korsgaard wrote:
> A bit stupid for a 'pure C' library, but ok - Committed both, thanks.

Heh, yes, the problem is that it depends on protobuf which is C++
